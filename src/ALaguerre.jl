module ALaguerre

    function aLag(k, n, x)

        C = zeros(k + n + 1)
        C[1] = 1

        global C

        for j in 1 : k + n

            M = zeros(k + n + 1)

            for i in 1 : k + n + 1
    
                M[i] = M[i] - C[i]

                if i < k + n + 1

                    M[i + 1] = M[i + 1] + C[i]

                end

            end

            for i in 1 : k + n + 1

                C[i] = M[i]

            end

        end

        K = zeros(k + n + 1)
        Kpow = zeros(k + n + 1)

        for i in 1 : k + n + 1

            K[i] = (factorial(k + n) / factorial(k + n - i + 1)) * C[i]
            Kpow[i] = k + n - (i - 1)

        end

        A = zeros(n + 1)
        Apow = zeros(n + 1)

        for i in 1 : n + 1

            x0 = Int(Kpow[i])

            A[i] = (factorial(x0) / factorial(x0 - k)) * K[i] * ((-1) ^ k)
            Apow[i] = Kpow[i] - k

        end

        z = 0

        global z

        for i in 1 : n + 1

            z = z + (A[i]) * (x ^ (Apow[i]))

        end

        return z

    end

    export aLag

end
