require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#full_title" do
    context "page_title exists as test" do
      it "full_title is 'test - BIGBAG Store'" do
        expect(full_title("test")).to eq "test - BIGBAG Store"
      end
    end

    context "page_title is nil" do
      it "full_title is 'BIGBAG Store'" do
        expect(full_title(nil)).to eq "BIGBAG Store"
      end
    end

    context "page_title is blank" do
      it "full_title is 'BIGBAG Store'" do
        expect(full_title("")).to eq "BIGBAG Store"
      end
    end
  end
end
