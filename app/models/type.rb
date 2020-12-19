class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'ノーマル'},
    { id: 3, name: 'ほのお'},
    { id: 4, name: 'みず'} ,
    { id: 5, name: 'くさ'},
    { id: 6, name: 'でんき'},
    { id: 7, name: 'こおり'},
    { id: 8, name: 'かくとう'},
    { id: 9, name: 'どく'},
    { id: 10, name: 'じめん'},
    { id: 11, name: 'ひこう'},
    { id: 12, name: 'エスパー'},
    { id: 13, name: 'むし'},
    { id: 14, name: 'いわ'},
    { id: 15, name: 'ゴースト'},
    { id: 16, name: 'ドラゴン'},
    { id: 17, name: 'あく'},
    { id: 18, name: 'はがね'},
    { id: 19, name: 'フェアリー'}
  ]

  # include ActiveHash::Associations
end
