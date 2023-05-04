class AddCityToDogSitters < ActiveRecord::Migration[7.0]
  def change
    add_reference :dog_sitters, :city, null: false, foreign_key: true
  end
end
