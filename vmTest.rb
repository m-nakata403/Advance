require './VendingMachine'
require 'minitest/autorun'

module ProductInterfaceTest
  def test_implements_the_name_interface
    assert_respond_to(@object, :name)
  end

  def test_implements_the_price_interface
    assert_respond_to(@object, :price)
  end
end


class TabacoTest < Minitest::Test
include ProductInterfaceTest

  def setup
    @tabaco = @object = Tabaco.new(name: 'テックタバコ', price: 300)
  end

  def test_name
    assert_equal 'テックタバコ', @tabaco.name
  end

  def test_price
    assert_equal 480, @tabaco.price
  end
end


class VendingMachineTest < Minitest::Test
  def setup
    tabacos = [
      { name: '第一タバコ', price: 100 },
      { name: 'サムライ', price: 100 },
      { name: 'キャッツアイ', price: 100 }
     ]
    @products = tabacos.map { |b| Tabaco.new({ name: b[:name], price: b[:price] }) }
    @sales_maneger = Minitest::Mock.new
    @input = rand(2)
    @name = @products[@input].name
  end

  def test_transaction
    vm = VendingMachine.new(@products, @input, @sales_maneger)
    @sales_maneger.expect(:update, 160, [@products[@input]])
    assert_output(stdout = 
      "購入したい商品を以下から選んで、金額を入力してください
      [0] 商品名：第一タバコ 税込み価格：160円
      [1] 商品名：サムライ 税込み価格：160円
      [2] 商品名：キャッツアイ 税込み価格：160円
      #{@name}が選択されました") {vm.transaction}
    vm.transaction
    @sales_maneger.verify
  end
end
