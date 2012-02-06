require File.expand_path('../../spec_helper', __FILE__)

describe Harvester::TimeEntry do
  it "should initialize" do
    time_entry = Harvester::TimeEntry.new
  end

  it "should initialize with typical fields" do
    time_entry = Harvester::TimeEntry.new(:spent_at => "2011-01-01", :hours => 5.1, :notes => "Writing this gem")
    time_entry.spent_at.should == "2011-01-01"
    time_entry.hours.should == 5.1
    time_entry.notes.should == "Writing this gem"
  end
end
