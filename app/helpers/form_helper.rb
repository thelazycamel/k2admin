module FormHelper

  def show_user_image(user)
    url = if !user.image.present?
      "https://www.k2poker.io/images/profile-images/fish.png"
    elsif user.image.starts_with?("http")
      user.image
    else
     "https://www.k2poker.io#{@user.image}"
    end
    image_tag(url, width: "70px", height: "70px")
  end

  def submit_button_label(action, class_name)
    case action
    when "new"
      "Create #{class_name}"
    when "edit"
      "Update #{class_name}"
    else
      "Submit"
    end
  end

  def starting_chip_values
    [1048576,524288,262144,131072,65536,32768,16384,8192,4096,2048,1024,512,256,128,64,32,16,8,4,2,1].reverse
  end

  def max_score_values
    [64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384,131072,1048576]
  end

  def tournament_image_values
    [
      ["Cardano", "/images/tournament/cardano.svg"],
      ["Duel", "/images/tournament/duel.svg"],
      ["Mini Tournament", "/images/tournament/mini-tournament.svg"],
      ["Monero", "/images/tournament/monero.svg"],
      ["Private", "/images/tournament/private.svg"],
      ["Nano", "/images/tournament/nano.svg"],
      ["Waves", "/images/tournament/waves.svg"]
    ]
  end

end
