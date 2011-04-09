module RequestsHelper
  def status_options
    status_options = [
      ['Не начато', 'not-stadted'],
      ['Начато', 'started'],
      ['Закончено', 'finished'],
      ['Закрыто', 'closed']
    ]
  end
end
