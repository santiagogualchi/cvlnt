test_that("parse_args works", {
  expect_equal(parse_args(list()), character(0))

  expect_equal(parse_args(list("block-height" = "11601973")),
               "block-height=11601973")

  expect_equal(parse_args(list("block-height" = "11601973",
                               "page-number" = "1")),
               "block-height=11601973&page-number=1")

  expect_error(parse_args(list("block-height" = "11601973"), "1"))
})
