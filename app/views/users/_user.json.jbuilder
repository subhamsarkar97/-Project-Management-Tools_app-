json.extract! user, :id, :firstname

json.sgid.attachable_sgid 
json.content render(partial: 'users/user', locals: { user:user }, formats: [:html])