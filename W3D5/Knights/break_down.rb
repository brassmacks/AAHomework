def return_number(a)
      ((a / 2)**2) * (65 - (a / 2))
end


def inheretence_based_on_retirement(age)
    time_spent_working = age/2
    accrued_assets = time_spent_working**2
    time_left_to_spend_money = (65 - time_spent_working)
    inheretence = accrued_assets * time_left_to_spend_money
    return inheretence
end
