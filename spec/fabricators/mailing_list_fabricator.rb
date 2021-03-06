# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.
# == Schema Information
#
# Table name: mailing_lists
#
#  id                       :integer          not null, primary key
#  name                     :string(255)      not null
#  group_id                 :integer          not null
#  description              :text(65535)
#  publisher                :string(255)
#  mail_name                :string(255)
#  additional_sender        :string(255)
#  subscribable             :boolean          default(FALSE), not null
#  subscribers_may_post     :boolean          default(FALSE), not null
#  anyone_may_post          :boolean          default(FALSE), not null
#  preferred_labels         :string(255)
#  delivery_report          :boolean          default(FALSE), not null
#  main_email               :boolean          default(FALSE)
#  mailchimp_api_key        :string(255)
#  mailchimp_list_id        :string(255)
#  mailchimp_syncing        :boolean          default(FALSE)
#  mailchimp_last_synced_at :datetime
#

Fabricator(:mailing_list) do
  name { Faker::Company.name }
end
