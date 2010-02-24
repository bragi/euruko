Given /^deadline for presentations is not reached yet$/ do
  Presentation.deadline = 1.day.from_now
end

Given /^deadline for presentations is reached$/ do
  Presentation.deadline = Time.now
end

