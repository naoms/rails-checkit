class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :boolean
end
