test_that("all_named works", {
  expect_equal(all_named(list(a = 1, b = 2)),
               TRUE)
  expect_equal(all_named(list(a = 1, 2)),
               FALSE)
  expect_equal(all_named(list(1, 2)),
               FALSE)
})
