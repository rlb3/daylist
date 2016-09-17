defmodule DaylistTest do
  use ExUnit.Case
  doctest Daylist

  test "daylist" do
    assert Daylist.run({:sun, :sat}) == [:sun, :mon, :tues, :wed, :thurs, :fri, :sat]
  end

  test ":sun to :tues" do
    assert Daylist.run({:sun, :tues}) == [:sun, :mon, :tues]
  end

  test ":wed to :sat" do
    assert Daylist.run({:wed, :sat}) == [:wed, :thurs, :fri, :sat]
  end

  test ":wed to :fri" do
    assert Daylist.run({:wed, :fri}) == [:wed, :thurs, :fri]
  end

  test ":sat to :sun" do
    assert Daylist.run({:sat, :sun}) == [:sat, :sun]
  end

  test ":sat to :wed" do
    assert Daylist.run({:sat, :wed}) == [:sat, :sun, :mon, :tues, :wed]
  end
end
