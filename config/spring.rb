# frozen_string_literal: true

Spring.quiet = true
Spring.watch(
  '.ruby-version',
  '.env',
  '.env.development',
  '.env.test',
  'tmp/restart.txt',
  'tmp/caching-dev.txt'
)
