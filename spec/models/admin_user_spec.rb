describe AdminUser, "#admin?" do
  subject { FactoryGirl.create(:admin_user) }

  its(:admin?) { should be_true }
end

