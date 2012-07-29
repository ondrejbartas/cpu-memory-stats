# Cpu Memory Stats

Simple gem for getting information about cpu and memory usage

Currently only for Mac OS X & BSD

## Usage

``` ruby
puts CpuMemoryStats.get
# {
#   :cpu=>{
#     :user=>56.25, 
#     :system=>43.75, 
#     :idle=>0.0, 
#     :nice=>0, 
#     :interupt=>0
#   },
#   :memory=>{
#     :wired=>1147142144,
#     :active=>2091909120,
#     :inactive=>1045430272,
#     :used=>4283432960,
#     :free=>10145792
#   },
#   :load=>[3.03, 3.17, 3.13],
#   :cpu_percent=>{
#     :user=>56.25, 
#     :system=>43.75, 
#     :idle=>0.0, 
#     :nice=>0.0, 
#     :interupt=>0.0
#   },
#   :memory_percent=>{
#     :wired=>13.37, 
#     :active=>24.39, 
#     :inactive=>12.19, 
#     :used=>49.93, 
#     :free=>0.12
#   }
# }
```


## Contributing to cpu-memory-stats
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Ondrej Bartas. See LICENSE.txt for
further details.

