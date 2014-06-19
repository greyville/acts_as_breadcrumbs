require 'active_record/acts/breadcrumbs'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Breadcrumbs }
