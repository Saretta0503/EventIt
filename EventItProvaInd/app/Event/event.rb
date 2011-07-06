# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Event
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Event.
  # enable :sync

  property :id, :integer # deve diventare auto-increment
      property :category, :integer # id della categoria di appartenenza
      property :title, :string
      property :description, :string
      property :timeStart, :string
      property :dateStart, :string
      property :timeEnd, :string
      property :dateEnd, :string
      property :advisedTime, :string

  property :street, :integer
      property :number, :string
      property :cap, :integer
      property :city, :string
      property :province, :string
      property :region, :string
      property :country, :string
            
      index :idEvent, [:id]
end
