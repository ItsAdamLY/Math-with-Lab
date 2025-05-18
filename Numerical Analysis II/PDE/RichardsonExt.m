function retval = RichardsonExt (input1, input2)

    array = zeros((n,n))

    array(0,0) = N1(fx,x0,h) #N1(h)

    m = 2 # m = i+1

    for i in range(2, n):
        array(i,0) = N1(fx,x0,h/(2*i)) #N1(h/n)

        for j in range (1,n):

            if j<=i:
                array(i,j) = (4^(i-1)*array(i,j-1)-array(i-1,j-1))/(4^(m-1)-1)

        m = m+1

endfunction
