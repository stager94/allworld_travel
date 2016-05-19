class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :h1
      t.text :keywords
      t.text :description
      t.string :offname
      t.string :stolica
      t.string :language
      t.string :valute
      t.string :ploscha
      t.string :naselenie
      t.string :datanezavis
      t.string :delenie
      t.string :glava
      t.string :zakon
      t.string :ispolnit
      t.text :shortdesc
      t.text :googlemap
      t.text :descforturist
      t.text :primech
      t.text :visum
      t.text :chtonugnoznat
      t.text :ceny
      t.text :valutes
      t.text :jazik
      t.text :bezopasnost
      t.text :oteli
      t.text :pitanie
      t.text :transport
      t.text :prazdniki
      t.text :internet
      t.text :chtobrat
      t.text :suvenir
      t.text :transport
      t.text :dostoprimech
      t.text :politika
      t.text :naselenie
      t.text :cultura
      t.references :region

      t.timestamps
    end
    add_index :countries, :region_id
  end
end
