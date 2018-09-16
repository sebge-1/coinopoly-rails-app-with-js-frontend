function Portfolio(data) {
  this.id = data.id
  this.name = data.name;
  this.public = data.public;
  this.positions = data.positions;
  this.value = data.value
}

Portfolio.prototype.injectNameValue = function() {
  $("#name").text(this.name);
  $("#portfolioValue").text(this.value);
}

Portfolio.prototype.renderTemplate = function() {
  return Portfolio.template(this)
}

Portfolio.prototype.setupTemplate = function() {
  let portofolioHTML = this.renderTemplate();
  $('.card-group').append(portofolioHTML);
}
