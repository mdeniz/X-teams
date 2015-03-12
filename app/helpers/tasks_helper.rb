module TasksHelper

  def verticalDate(task, text)
    endCls = ''
    date = text.to_sym == :start ? task.start : task.end
    endCls = 'end' unless text.to_sym == :start
    if date
      "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
        <tbody>
        <tr>
          <td class=\"task_bar_month #{endCls}\">
            #{Date::ABBR_MONTHNAMES[date.month].upcase}
          </td>
        <tr>
          <td class=\"task_bar_day_of_month #{endCls}\">
            #{date.day}
          </td>
        <tr>
          <td class=\"task_bar_year #{endCls}\">
            #{date.year}
          </td>
        </tr>
        </tbody>
      </table>"
    else
      ''
    end
  end

end
