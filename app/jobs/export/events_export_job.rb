# encoding: utf-8

#  Copyright (c) 2017, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

class Export::EventsExportJob < Export::ExportBaseJob

  self.parameters = PARAMETERS + [:event_type, :year, :parent]

  def initialize(format, event_type, year, parent, filename)
    super()
    @format = format
    @exporter = Export::Tabular::Events::List
    @filename = filename
    @event_type = event_type
    @year = year
    @parent = parent
  end

  private

  def entries
    @parent.events.
      where(type: @event_type).
      in_year(@year).
      order_by_date.
      preload_all_dates.
      uniq
  end
end
