module UploadsHelper
	def submit_to_uploadable(uploadable, f)
		if uploadable.class == Feature
			render partial: 'uploads/feature_submit', :locals => {:f => f, :uploadable => uploadable}
		else
			render partial: 'uploads/project_submit', :locals => {:f => f, :uploadable => uploadable}
		end
	end
end
