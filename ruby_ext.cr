lib LibRuby
  type VALUE = Void*

  $rb_cObject : VALUE

  fun rb_define_class(name : UInt8*, superclass : VALUE) : VALUE
end

fun init = Init_ruby_ext
  GC.init
  LibCrystalMain.__crystal_main(0, nil)

  LibRuby.rb_define_class("Crystal", LibRuby.rb_cObject)
end
