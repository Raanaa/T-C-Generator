class Generator

    def generate (clauses_file_name , sections_file_name , template_file_name)
        clauses  = eval(File.read(clauses_file_name))
        sections  = eval(File.read(sections_file_name))

        template = File.readlines(template_file_name).each do |line|

            # to skip lines including [] but without clauses or sections  ex:: Is made of [bla bla bla - bla bla bla].
            if replacment = line[/\[(.*?)\]/, 1] and replacment_arr = replacment.split('-')   and (replacment_arr[0] == "CLAUSE" or  replacment_arr[0] == "SECTION") and replacment_arr[1] =~ /\A\d+\Z/

                if  replacment_arr[0] == "SECTION"
                    clauses_ids , clauses_texts = [] , []
                    section = sections.detect{|c| c[:id] == replacment_arr[1].to_i }
                    clauses_ids = section[:clauses_ids] unless section.nil?    # to avoid craches if section_id not found in sections hash
                    clauses_texts = clauses_ids.map{|i| 
                        if clause = clauses.detect{|c| c[:id] == i}
                            clause = clause[:text]
                        end
                    }
                    replacment_text = clauses_texts.join(";") unless clauses_texts.empty?
                else
                    clause = clauses.detect{|c| c[:id] == replacment_arr[1].to_i }
                    replacment_text = clause[:text].to_s unless clause.nil?   # to avoid craches if clause_id not found in clauses hash
                end

                unless replacment_text.nil?
                    replacment = line[/\[(.*?)\]/]
                    line[replacment] = replacment_text
                end
            end 
        end

        # creates T&C document
        template = template.collect(&:strip).join("\n")
        IO.write("T&C.txt", template)
        puts template
        template
    end
end

Generator.new.generate("clauses.txt" , "sections.txt" , "template.txt")
