defmodule TilpdatWeb.PageView do
  use TilpdatWeb, :view

  defp pretty_print_data(date) do
    hour_offset = Timex.now("Europe/Oslo").hour - Timex.now.hour

    day_suffix = case date.day do
      1 -> "st"
      2 -> "nd"
      3 -> "rd"
      _ -> "th"
    end

    month_name = case date.month do
      1 -> "January"
      2 -> "February"
      3 -> "March"
      4 -> "April"
      5 -> "May"
      6 -> "June"
      7 -> "July"
      8 -> "August"
      9 -> "September"
      10 -> "October"
      11 -> "November"
      12 -> "December"
      _ -> "No month"
    end

    "the #{date.day}#{day_suffix} of #{month_name}, " <>
    "#{date.hour + hour_offset}:#{date.minute}"
  end

  defp greet do
    [
      "So nice to see you",
      "With you here, the day just got better",
      "Born to be wild",
      "¯\_(ツ)_/¯",
      "Pure Kyb ❤️",
      "When you are Russian for food, there is no time for Stalin"
    ]
    |> Enum.random
  end

end
