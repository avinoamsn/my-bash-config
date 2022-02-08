# DevOps & programming tips that I've collected over the years

## Bash

### use an argument from the previous command

```bash
!^      # first argument
!$      # last argument
!*      # all arguments
!:2     # second argument

!:2-3   # second to third arguments
!:2-$   # second to last arguments
!:2*    # second to last arguments
!:2-    # second to next to last arguments

!:0     # the command
!!      # repeat the previous line
```
