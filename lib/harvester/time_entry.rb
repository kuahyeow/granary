module Harvester
  class TimeEntry
    API_FIELDS = [:spent_at, :hours, :notes, :id, :project_id, :task_id, :user_id]
    API_FIELDS.each {|field| attr_accessor field}

    def initialize(fields = {})
      API_FIELDS.each do |accessor|
        send "#{accessor}=", fields[accessor]
      end
    end
  end
end
