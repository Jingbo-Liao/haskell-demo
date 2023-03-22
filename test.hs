--funcName arguments = expression  --定义函数的一般形式
area r = pi * r ^ 2 -- 定义了一个函数
area 101 -- 调用了函数
f1 f2 3.14 -- 函数调用是左结合，等效于(f1 f2) 3.14

--模式匹配方式定义
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)   

--as模式，是将一个名字和 @ 置于模式前，可以在按模式分割参数值时仍保留对其整体的引用。如nameGlobal@(x:y:ys)，nameGlobal会匹配出与 x:y:ys 对应的东西。as模式在较大的模式中保留对整体的引用，从而减少重复性的工作。

heron a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where                     -- where在表达式中局部绑定了名字s与一个值。也可以在表达式之前用let ... in语法
    s = (a + b + c) / 2

absolute x                 -- 绝对值函数，使用了分段函数语法糖（称作Guards）
    | x < 0     = 0 - x
    | otherwise = x        -- 兜底条件

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= 18.5 = "You're underweight."  
    | bmi <= 25.0 = "You're normal. "  
    | bmi <= 30.0 = "You're fat."  
    | otherwise   = "You're overweight."  
    where bmi = weight / height ^ 2  -- 使用where定义多个名字来避免重复
