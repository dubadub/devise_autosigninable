require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  fixtures :people

  def setup
    @person = people(:person1)
  end

  test 'if lockable disabled valid_for_autosignin_token_authentication? should not use failed_attempts on true result' do
    assert @person.valid_for_autosignin_token_authentication?({:autosignin_token =>'01869a0f18c27087626d3ca2c4cb2d71'})
  end

  test 'if lockable disabled valid_for_autosignin_token_authentication?  should not use failed_attempts on false result' do
    assert_equal false, @person.valid_for_autosignin_token_authentication?({:autosignin_token =>'0186918c27087626d3ca2c4cb2d71'})
  end

  test 'autosignin expires should be enabled and generates new token on login' do
    assert_equal Person.autosignin_expire, true
    old_token = @person.autosignin_token
    @person.valid_for_autosignin_token_authentication?({:autosignin_token =>'01869a0f18c27087626d3ca2c4cb2d71'})
    assert_not_equal old_token, @person.autosignin_token
  end


end