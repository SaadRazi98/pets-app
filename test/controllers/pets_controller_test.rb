require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/pets.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Pet.count, data.length
  end

  test "create" do
    assert_difference "Pet.count", 1 do
      post "/pets.json", params: { name: "Donovan", breed: "pig (Duroc)", image_url: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft2.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcT7uW0D5d0Qm9ZBwGFGUQfwG8MHzBSBkrIUk_d8XXOvXOGfXMB848hFHqIxOkTjjqWo2Ty4YSIHLe7cYg0&psig=AOvVaw1AuoBiqmlJMOzPNlqXMUU2&ust=1682528530205000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPiEgq3Bxf4CFQAAAAAdAAAAABAE" }
      assert_response 200
    end
  end

  test "update" do
    pet = Pet.first
    patch "/pets/#{pet.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "show" do
    get "/pets/#{Pet.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "breed", "image_url", "created_at", "updated_at"], data.keys
  end

end
