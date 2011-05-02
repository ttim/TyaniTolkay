module ApplicationHelper
  #add unicode correct string methods
  begin
    require 'unicode'
    String.class_eval 'def downcase
     Unicode::downcase(self)
   end
   def downcase!
     self.replace downcase
   end

   def upcase
     Unicode::upcase(self)
   end
   def upcase!
     self.replace upcase
   end
   def capitalize
     Unicode::capitalize(self)
   end

   def capitalize!
     self.replace capitalize
   end'
  rescue LoadError
    # gem на машине не установлен - об этом полезно ругнуться в логи
  end
end
