class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'category' },
    { id: 2, name: 'status' },
    { id: 3, name: 'charge' },
    { id: 4, name: 'city' },
    { id: 5, name: 'day' }
  ]
 end
