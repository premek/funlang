return {

{[[ 1.<(2){333} ]], 333},
{[[ 1.<(1){333} ]], nil},

{[[ 3.>(2){333} ]], 333},
{[[ 1.>(2){333} ]], nil},

{[[ 1.<=(2){333} ]], 333},
{[[ 1.<=(0){333} ]], nil},

{[[ 1.>=(1){333} ]], 333},
{[[ 1.>=(3){333} ]], nil},

{[[ 1.=(1){333} ]], 333},
{[[ 1.=(2){333} ]], nil},


{[[ 1.plus(2) ]], 3},
{[[ 3.minus(2) ]], 1},

{[[ 3.negate ]], -3},
{[[ 3.negate.negate.negate.negate ]], 3},

{[[
n: 0
3.times{n << n.plus(1)}
n
]], 3},


{[[
n: 0
6.times{i -> n << i.plus(n)}
n
]], 15},

{[[
n: 0
6.times{i -> n << n.plus(i)}
n
]], 15},

}
