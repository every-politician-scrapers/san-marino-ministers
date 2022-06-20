#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      tds[1].text.encode("UTF-8", "Windows-1252").tidy
    end

    def position
      tds[0].text.encode("UTF-8", "Windows-1252").tidy
    end

    private

    def tds
      noko.css('td')
    end
  end

  class Members
    def member_container
      noko.xpath('//table//tr[td[contains(.,"Segret")]]')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv if file.exist? && !file.empty?
