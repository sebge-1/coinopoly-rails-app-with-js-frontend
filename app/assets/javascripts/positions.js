function Position(data) {
  this.id = data.id;
  this.quantity = data.quantity;
  this.coinName = data.coin.name;
  this.coinImg_url = data.coin.img_url;
  this.value = parseFloat(data.coin.value) * this.quantity
}

Position.prototype.renderTemplate = function() {
  let positionHTML = HandlebarsTemplates['new_position']( this)
  $('.card-group').append(positionHTML)
  }
