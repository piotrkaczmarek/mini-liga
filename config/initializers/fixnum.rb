class Fixnum
  def to_weekday
    [(I18n.t :sunday), (I18n.t :monday), (I18n.t :tuesday), (I18n.t :wednesday), (I18n.t :thursday), (I18n.t :friday), (I18n.t :saturday) ][self] if self.between? 0,6
  end
end
