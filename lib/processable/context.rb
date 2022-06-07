# frozen_string_literal: true

module Processable
  class Context
    attr_reader :processes, :decisions, :executions
    attr_accessor :services, :listeners, :utils

    def initialize(sources: nil, moddles: nil, services: {}, listeners: [], utils: {})
      @services = services
      @listeners = Array.wrap(listeners)
      @utils = utils

      @processes = []
      @decisions = {}
      @executions = []

      Array.wrap(sources).each do |source|
        if source.include?("http://www.omg.org/spec/DMN/20180521/DC/")
          moddle = ProcessableServices::DecisionReader.call(source)
          moddle["drgElement"].each { |d| decisions[d["id"]] = source }
        else
          moddle = ProcessableServices::ProcessReader.call(source)
          builder = Bpmn::Builder.new(moddle)
          @processes = @processes + builder.processes
        end
      end

      Array.wrap(moddles).each do |moddle|
        if moddle["drgElement"]
          moddle["drgElement"].each { |d| decisions[d["id"]] = source }
        else
          builder = Bpmn::Builder.new(moddle)
          @processes = @processes + builder.processes
        end
      end
    end

    def notify_listener(event)
      listeners.each do |listener|
        listener[event[:event]].call(event) if listener[event[:event]]
      end
    end

    def process_by_id(id)
      processes.each do |process|
        return process if process.id == id
        process.sub_processes.each do |sub_process|
          return sub_process if sub_process.id == id
        end
      end
      nil
    end

    def element_by_id(id)
      processes.each do |process|
        element = process.element_by_id(id)
        return element if element
      end
      nil
    end

    def execution_by_id(id)
      executions.find { |e| e.id == id }
    end

    def execution_by_step_id(step_id)
      executions.find { |e| e.step.id == step_id }
    end
  end
end
