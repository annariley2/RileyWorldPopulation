test_that('Valid country', {
  expect_error(countrypop("Wakanda"))
  expect_visible(countrypop("Germany"))
})
