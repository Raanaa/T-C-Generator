# T-C-Generator

Transforms the template into a Document expanding the template tags into their rappresentation using the dataset

The T&C generator is software which given:    
- A template
- A dataset

### Template 
Is a text made of:       
 1 - Plaintext         
 2 - Tags

### TAGS   
The tags supported are:   
1 - Clauses: [CLAUSE-#{ID}]         
2 - Sections: A group of clauses, represented with [SECTION-#{ID}]

### How to setup and run the application
   1 - you only have to clone this repo ::  $ git clone https://github.com/Raanaa/T-C-Generator.git         
   2 - move to the repo directory :: **$ cd T-C-Generator**           
   3 - you will find a **template.txt** file you can edit it and paste your plaintext         
   4 - you will find a **clauses.txt** file you can edit it and paste your Clauses           
   5 - you will find a **sections.txt** file you can edit it and paste your Sections          
   6 - now ready to run T&C generator :: **$ ruby generator.rb**                  
   7 - congratulations, you will find your **T&C.txt** file created :D               
   
### How to setup and run automated tests
   $ gem install rspec           
   $ rspec spec/generator_spec.rb            
 
   
