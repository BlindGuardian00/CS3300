FactoryBot.define do
    factory :student do
      id {3}
      email {"dmitche3@uccs.edu"}
      password {"74774744"}
      # Add additional fields as required via your User model
    end
  
    # Not used in this tutorial, but left to show an example of different user types
    # factory :admin do
    #   id {2}
    #   email {"test@admin.com"}
    #   password {"qwerty"}
    #   admin {true}
    # end
  end