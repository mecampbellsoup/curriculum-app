authorization do
  role :admin do
    has_permission_on [:assignments, :groups, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:assignments], :to => [:add_student]
  end

  role :teacher do
    #has_permission_on [:assignments, :groups], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :student do
    #has_permission_on [:assignments], :to => [:show]
  end

  role :guest do
    has_permission_on [:assignments, :groups, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

end