# 明示的に変数を使って明示的にブロックをわたすときには&をつけて渡す
def foo(a, b, &block)
  p 'begin block'
  foo2(a, b, &block)
  p 'end block'
end

def foo2(a, b, &block)
  p 'begin block 2'
  block.call(a, b)
  p 'end block 2'
end


p '#############################################'
foo('a1', 'b1') do |a, b|
  p a
  p b
end

p '#############################################'
# 上と同じ
pr = Proc.new do |a, b|
  p a
  p b 
end
foo('a1', 'b1', &pr)
