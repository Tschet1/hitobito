# encoding: utf-8

#  Copyright (c) 2017, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

class Export::SubscriptionsJob < Export::ExportBaseJob

  self.parameters = PARAMETERS + [:mailing_list_id, :household]

  def initialize(format, mailing_list_id, household, filename)
    super()
    @mailing_list_id = mailing_list_id
    @format          = format
    @household       = household
    @exporter        = exporter
    @filename        = filename
  end

  private

  def mailing_list
    @mailing_list ||= MailingList.find(@mailing_list_id)
  end

  def entries
    mailing_list.people.includes(:primary_group).order_by_name
  end

  def exporter
    return Export::Tabular::People::Households if @household
    Export::Tabular::People::PeopleAddress
  end

end
