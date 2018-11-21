# DrabSpeed

   ## Purpose
   Purpose of this page is benchmarking the Drab performance across three kinds of updating techniques: pokeing the main page assigns, pokeing the partial templates assigns, and setting the html by rendering the updated partial from the Commander. These techniques can show performances that can be really very different from each other, based on how complex the page is, on the size of the assignmnts, and of course the performances of the network and of the server and client computers. It is useful because before having a deeper knowledge on how Drab works, it cannot be easy to imagine that the perfonmances can change a lot based on how you design the page, so this small app can help you to simulate diferent condition and discover which technique is the best for your case.
    
    ## Play with me
    Below you can play with the examples adjusting the number of item, you will see that more items are poked to the main page, more time will take some updating operations to complete.
    
    ## Which technique is the best?
    In general, you will see that pokeing directly the assigns of the main page will give you the worst results, also when you haven't any item on the page. Pokeing the partials always give you better performances, so it is always preferable to split a page in many partials, and updating each partial indipendently from each other. The third technique gives the best results in term of speed, but add a little overhead to the code, both in the `.eex` files and in the Commander handlers, because you have to choose and apply a way to identify each element to update uniquely, and because a little bit more of code is needed in the Commander. This doesn't at all mean that the third tecnique is always preferable over the others, you have to choose carefully the right technique depending on the specific needes toy have in terms of page complexity, speed issues and code mantenibility.
    
    ## Different code, different stress
    Three kind of test are supplied: you can increment/decrement a counter, you can start a countdown counter, and you can trig a sort of scroll animation. Each of these tests stress Drab differently one from each other, and their performances can changes dramatically by the context. Only experimenting on them, looking at the code and changing it give you the possibility of understand which tecnique can be the best for a specific requirement. Please note that the code of these examples are written to be explicit, not to be neither elegant nor smart.

    ### Contacts
    guido.tripaldi@gmail.com
    





