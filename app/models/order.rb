class Order < ApplicationRecord

	
	#沒有 name 和 email，就不該被建立
	validates :name, presence: true

	# 我們要確保輸入的名字有一定的長度
	#名字最少要有兩個英文字母，最多不可超過兩百個英文字母
	validates :name, length: { minimum: 2 }
	validates :name, length: { maximum: 200 }

	#電話獨特性
	validates :phone, uniqueness: true
	validates :phone, length: { minimum: 10 }
	validates :phone, length: { maximum: 10 }
	
	
	#任何 email 應該都是獨一無二的，所以應該卻確保它的獨特性
	validates :email, presence: true
	validates :email, uniqueness: true


end
