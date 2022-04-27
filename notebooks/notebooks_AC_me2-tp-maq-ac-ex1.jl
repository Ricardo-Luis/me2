### A Pluto.jl notebook ###
# v0.19.3

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 1f39885e-3df2-4d9b-98ee-534bd66f3ad7
md"""
[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/me2/blob/main/notebooks/AC/me2-tp-maq-ac-ex1.jl)
"""

# ╔═╡ aa7b7835-802d-46c7-8245-6bf29d799026
html"<button onclick='present()'>Presentation mode</button>"

# ╔═╡ df765cd9-5fd1-490a-a4f5-c05edb26ef1b
md"""
# Máquina síncrona trifásica  
**(pólos lisos)**
## Alternador em regime isolado (Ex.1)
Máquinas síncronas trifásicas, exercício 1:
"""

# ╔═╡ 520962f0-6513-4615-ba08-a973b851ec8f
md"""
**Um alternador síncrono trifásico, 390kVA, 1250V, 50Hz, 750rpm, ligado em
triângulo, apresenta os seguintes resultados dos ensaios em vazio e curto-circuito:**
"""

# ╔═╡ 99485bd5-46b8-425b-8974-6056c903b062
begin
	Iₑₓ=[11.5, 15.0, 20.0, 23.5, 29.0, 33.5]
	fem=[990, 1235, 1460, 1560, 1640, 1660]
	Icc=[139, 179, 242, 284, 347, 400]
	Iₑₓ,fem,Icc
end

# ╔═╡ 82ddc4f5-e411-48da-abab-cc2029ee02f0
md"""
**A resistência medida aos bornes do enrolamento do induzido é 0,144Ω. Determine:**
"""

# ╔═╡ 8da1cb6d-5f5a-49b1-9ab8-9a00d229b519
(Sₙ, Uₙ, f, n, RΩ)=(390e3, 1250, 50, 750, 0.144)

# ╔═╡ 0a44521c-58b4-47d3-968c-d345799e42bb
md"""
## a) $$R_s$$ 
**A resistência por fase do enrolamento induzido do alternador síncrono, considerando um coeficiente de correção do efeito pelicular da corrente de 1.2;**
"""

# ╔═╡ b90f442f-41aa-485b-b0f0-170e282c028c
md"""
A resistência medida aos bornes corresponde à resistência entre fases, por conseguinte, estando o estator em triângulo tém-se:
"""

# ╔═╡ 46318b60-7480-44f8-94bc-10f69a425d54
begin
	R=3*RΩ/2
	R=round(R, digits=3)
end

# ╔═╡ 90712d40-b1a5-445e-a1da-af62ecab7e59
md"""
O efeito pelicular da corrente, faz aumentar a resistência do condutor, pois em corrente alternada, esta tende a fluir na periferia dos condutores, quanto maior for a frequência angular elétrica. A resistência do estator, $$R_s$$ vem então dado por:
"""

# ╔═╡ 638d41c0-4a34-4a30-9928-ba88507334af
begin
	Rₛ=R*1.2
	Rₛ=round(Rₛ, digits=3)
end

# ╔═╡ b9f959bf-abc2-4cc8-9f1d-584bb4728e89
md"""
## b) Cálculo da tensão para um ponto de funcionamento
**A tensão de linha, para a corrente nominal e uma corrente de excitação de 33.5A,
considerando um factor de potência da carga de 0.9 indutivo;**
"""

# ╔═╡ 59f534f3-da67-406c-ae7f-9f3ddf13d1fe
md"""
Cálculo da corrente nonimal:
"""

# ╔═╡ 3570ce87-a57d-4abb-8477-f33957697952
begin
	Iₗ=Sₙ/(√3*Uₙ) # corrente de linha nominal
	Iₙ=Iₗ/(√3)	  # corrente por fase (ligação em triângulo)
	Iₙ=round(Iₙ, digits=1)
end

# ╔═╡ 94c43668-0ddd-4550-9bca-5b05a1ede581
md"""
O ensaio de curto-circuito permite determinar a impedância equivalente da máquina. Assim, para uma corrente de excitação de 33.5A têm-se uma corrente de curto-circuito de 400A e uma força electromotriz (fem) correspondente de 1660V.

"""

# ╔═╡ 5e679cb2-dd7f-4cf5-8035-54ae205eba1e
md"""
Assim, partindo do esquema equivalente do alternador síncrono de pólos lisos com estator em triângulo, a impedância síncrona, $$Z_s$$, vem dada por:
"""

# ╔═╡ 5d555c37-3ea9-4315-b31f-c5ce86896160
begin
	Icc₁=400
	E₀=1660
	Zₛ=E₀/(Icc₁/√3)
	Zₛ=round(Zₛ, digits=3)
end

# ╔═╡ 69998624-54dc-49a6-9053-0322c72982ea
md"""
Pelo triângulo de impedâncias obtém-se a reactância síncrona, $$X_s=$$ $Xₛ Ω:
"""

# ╔═╡ 67329e1c-c84a-4a64-abdf-d086b59cee6d
begin
	Xₛ=√(Zₛ^2-Rₛ^2)
	Xₛ=round(Xₛ, digits=3)
end;

# ╔═╡ a2c4ba4e-56fa-4aaa-ba4a-5b5acb3cb2d8
md"""
Cálculos auxiliares:
"""

# ╔═╡ ccec9d74-f4aa-4254-89a1-f99e2e1cf653
begin
	cosφ=0.9 #factor de potência considerado
	φ=-acos(cosφ)
	θ=atan(Xₛ/Rₛ)
end;

# ╔═╡ 7df06422-db2c-4494-97c1-6ed2a1bc77eb
md"""
O cálculo da tensão, $$U$$, corresponde à resolução da equação vectorial por fase:
"""

# ╔═╡ 87bf1d67-5f81-496e-a6ee-821b3f3eb1b0
md"""
$$\overline{E}_0=\overline{U}+(R_s+jX_s)\overline{I}$$

em que: $$\quad R_s+jX_s=Z_s∠\theta\:$$, sendo: $$\quad Z_s=\sqrt{R_s^{2}+X_s^{2}}\quad$$ e $$\quad \theta=\arctan \frac{X_s}{R_s}$$
"""

# ╔═╡ ce99f675-29ac-4413-94a9-febe1243e79d
md"""
Assim, a equação vectorial de $$\overline{E}_0$$ vem dada por:

$$E_0∠\delta=U∠0°+(Z_s∠\theta)(I∠\varphi)$$

Na equação vectorial acima desconhecem-se o ângulo de carga, $$\delta$$, e a tensão, $$U$$. Decompondo a equação vectorial nas suas coordenadas ortogonais (projecções dos vectores nos eixos real e imaginário), tém-se:

$$\begin{cases}
E_0\cos\delta=U+Z_sI\cos(\theta+\varphi)\\
E_0\sin\delta=Z_sI\sin(\theta+\varphi)\\
\end{cases}$$

Resolvendo, obtêm-se $$\delta=$$ $δ ° e $$U=$$ $U V
"""

# ╔═╡ 2385f6d9-1770-4fee-a7ab-3322f2d6e9ed
begin
	sinδ=(Zₛ/E₀)*Iₙ*sin(θ+φ)
	δ=asin(sinδ)
	U=E₀*cos(δ)-Zₛ*Iₙ*cos(θ+φ)
	U=round(U, digits=1)
	δ=rad2deg(δ)	#δ: ângulo de carga, em graus
	δ=round(δ, digits=2)
	U, δ 
end

# ╔═╡ e3a3c2f7-43f5-40ab-8693-9affc1130373


# ╔═╡ ff08e1d0-6acd-4b46-ab75-51329cb00c22
md"""
### Diagrama vectorial de tensões
"""

# ╔═╡ 57790c82-9d40-4244-8b5d-3fcf98ce12e7
md"""
Complementarmente, uma vez determinados os fasores da equação vectorial de $$\overline{E}_0$$ procede-se à representação do diagrama vectorial de tensões no plano complexo:
"""

# ╔═╡ ae01b249-cb76-43ae-9938-f489b93cc0ea
begin
	φ₁=rad2deg(φ)
	φ₁=round(φ₁, digits=3)
	K=8 # factor de escala da corrente
	Iₙ_=(K*Iₙ)∠(φ₁)
	U_=(U)∠(0)
	RₛIₙ_=(Rₛ*Iₙ)∠(φ₁)
	jXₛIₙ_=(Xₛ*Iₙ)∠(φ₁+90)
	E₀_=(E₀)∠(δ)
	plot([0, U_], arrow=:closed, legend=:topleft, label="U∠0°")
	plot!([0, Iₙ_], arrow=:closed, label="Iₙ∠φ")
	plot!([U_, U_+RₛIₙ_], arrow=:closed, label="RₛIₙ∠φ")
	plot!([U_+RₛIₙ_,U_+RₛIₙ_+jXₛIₙ_], arrow=:closed, label="XₛIₙ∠(φ+90°)")
	plot!([0,E₀_], arrow=:closed, label="E₀∠δ",
		  minorticks=5, ylims=(-1000,1000), xlims=(0,2000), size=(600,600))
end

# ╔═╡ 6d73fbfe-0cf7-4925-a814-c42438e75fe0


# ╔═╡ 96d3e48e-60bc-4c97-aac4-6517502fa936
md"""
### Efeito da corrente de carga e do factor de potência 💻
"""

# ╔═╡ f68a29b1-64c3-466b-987b-0c66b8385af3
begin
	H1=("I", @bind I₂ PlutoUI.Slider(0:1:1.4*Iₙ, default=Iₙ,show_value=true))
	H2=("φ -> cosφ", @bind phi₂ PlutoUI.Slider(-90:1:90, default=-30, show_value=true))
	H1, H2
end

# ╔═╡ 4287947f-5fcc-4400-b4ea-7ddb29d259cf
begin
	φ₂=deg2rad(phi₂)
	sinδ₂=(Zₛ/E₀)*I₂*sin(θ+φ₂)
	δ₂=asin(sinδ₂)
	U₂=E₀*cos(δ₂)-Zₛ*I₂*cos(θ+φ₂)
	δ₂=rad2deg(δ₂)
	φ₂=rad2deg(φ₂)
	I₂_=(K*I₂)∠(φ₂)
	U₂_=(U₂)∠(0)
	RₛI₂_=(Rₛ*I₂)∠(φ₂)
	jXₛI₂_=(Xₛ*I₂)∠(φ₂+90)
	E₀₂_=(E₀)∠(δ₂)
	plot([0, U₂_], arrow=:closed, legend=:bottomright, label="U∠0°", linewidth=2)
	plot!([0, I₂_], arrow=:closed, label="I∠φ", linewidth=2)
	plot!([U₂_, U₂_+RₛI₂_], arrow=:closed, label="RₛI∠φ", linewidth=2)
	plot!([U₂_+RₛI₂_,U₂_+RₛI₂_+jXₛI₂_], arrow=:closed, label="XₛI∠(φ+90°)", linewidth=2)
	plot!([0,E₀₂_], arrow=:closed,minorticks=5, label="E₀∠δ", linewidth=2,
		  ylims=(-1500,1500), xlims=(0,3000), size=(600,600)
	)
	# lugar geométrico da fem
	δ_locus=-5:1:90
	E₀_locus_=(E₀)∠.(δ_locus)
	plot!(E₀_locus_, linestyle=:dash, label="locus de E₀∠δ")
	# lugar geométrico de I
	φ_locus=-90:1:90
	I₂_locus_=(K*I₂)∠.(φ_locus)
	plot!(I₂_locus_, linestyle=:dash, label="locus de I∠φ")
end

# ╔═╡ e934fad8-c4fe-4e7f-bc64-e1c3f3e52460
md"""
!!! nota
	O estudante deverá procurar perceber as implicações no valor da tensão de saída, $$U$$, de um alternador em regime isolado, quando o valor de corrente, $$I$$, é alterado e/ou o seu factor de potência, $$\cos \varphi$$.
"""

# ╔═╡ d3581eff-e1c7-4e01-b722-3d94ff428746


# ╔═╡ 14df28f1-6cb0-4e18-b5f0-4c8f94d02a56
md"""
### Determinação de $$X_s$$ para diversos valores de $$I_{exc}$$
"""

# ╔═╡ 76b147a2-d33f-49ef-8236-444818042a12
md"""
O mesmo exercício poderia ser repetido para diferentes valores da corrente de campo. Note-se que a impedância e por conseguinte, a reactância síncrona da máquina variam em função do estado de magnetização da máquina.  

Aqui mostra-se o exemplo de cáculo da reactância síncrona, $$X_s$$, para variações sucessivas de $$2$$A na corrente de campo:
"""

# ╔═╡ f50dc850-e32d-4fb3-afd2-0217cf8df1fc
# Função de interpolação para a característica magnética:
E₀_i=Spline1D(Iₑₓ,fem);

# ╔═╡ 2dd82e2e-675f-40dd-882f-fe90db117589
# Função de interpolação da característica de curto-circuito:
Icc_i=Spline1D(Iₑₓ,Icc);

# ╔═╡ b350ee3d-7705-4712-a9bd-d16d4a83f89b
begin
	iₑₓ=11.5:2:33.5
	E₀_iₑₓ₁=E₀_i(iₑₓ)		# interpolação da característica magnética
	Icc_iₑₓ₁=Icc_i(iₑₓ)     # interpolação da característica de curto-circuito
	# Cálulo de Xs=f(Iex):
	Zₛ_iₑₓ₁=E₀_iₑₓ₁./(Icc_iₑₓ₁/√3)
	Xₛ_iₑₓ₁=.√(Zₛ_iₑₓ₁.^2 .-Rₛ^2)
	Xₛ_iₑₓ₁=round.(Xₛ_iₑₓ₁, digits=3)
	# Representação gráfica de Xs:
	plot(iₑₓ, Xₛ_iₑₓ₁, xlims=(0,35),
		title="Xₛ=f(Iₑₓ)", xlabel = "Iₑₓ (A)", ylabel="Xₛ (Ω)", label=:none)
end

# ╔═╡ cd338db8-8a5b-4ebf-a93d-95b1a7433de7


# ╔═╡ ba2a8447-a8a0-4ce8-9d53-03a0369703c6
md"""
## c) Características externas
**A característica exterior do alternador síncrono trifásico, com uma corrente de excitação de 33.5A, para um factor de potência 0.9 indutivo, unitário e 0.9 capacitivo;**
"""

# ╔═╡ 8a1756c9-6d37-4541-ba8d-586e95b4feda
md"""
Para uma corrente de excitação de 33.5A, a fem apresenta o valor de 1660V, como verificado na alínea anterior. 
"""

# ╔═╡ 9238a818-157c-4523-b6b2-139faf8ebe44
md"""
A determinação da característica externa deste alternador de polos lisos, $$U=f(I)$$ com corrente de campo e velocidade constantes,  corresponde à resolução da equação vectorial de $$\overline{E}_0$$ fazendo variar a corrente de carga, $$I$$, para um determinado factor de potência, $$\cos\varphi$$, imposto pela carga. 
"""

# ╔═╡ c53c93f9-1960-4999-a3d8-ec0c654f4275
md"""
É aqui que se tira verdadeiro partido de uma linguagem de computação científica na realização de cálculos sucessivos. Tal também é possível, recorrendo a folha de cálculo, como *MS Excel* ou *Google Sheets*, mas envolvendo algum trabalho suplementar devido à utilização de números complexos.
"""

# ╔═╡ 58011f3c-364f-42b7-a9de-17fe736f80d1
md"""
Determinação da característica externa para $$\cos\varphi=0,9(i)$$:
"""

# ╔═╡ 894c1642-9272-4624-b7a3-c8a882fbc337
begin
	I₃=0:1:1.5*Iₙ
	cosφ₃=0.9
	φ₃=-acos(cosφ₃)
	δ₃=asin.((Zₛ/E₀).*I₃*sin(θ+φ₃))  # δ: ângulo de carga, radianos
	U₃=E₀*cos.(δ₃)-Zₛ.*I₃*cos(θ+φ₃)	 # cálculo da característica externa
end;

# ╔═╡ 079234a4-3aa6-4932-8a25-2a8c8f290368
md"""
Determinação da característica externa para $$\cos\varphi=1$$:
"""

# ╔═╡ 373a9233-e5d1-4c18-a1aa-162f3a1a00be
begin
	δ₄=asin.((Zₛ/E₀).*I₃*sin(θ+0))  # δ: ângulo de carga, radianos
	U₄=E₀*cos.(δ₃)-Zₛ.*I₃*cos(θ+0)	 # cálculo da característica externa
end;

# ╔═╡ b2a13c34-84be-4c7d-bcd8-9186a4975559
md"""
Determinação da característica externa para $$\cos\varphi=0,9(c)$$:
"""

# ╔═╡ fee556d9-aa55-4187-b83c-afa2173e2adb
begin
	cosφ₅=0.9
	φ₅=acos(cosφ₅)
	δ₅=asin.((Zₛ/E₀).*I₃*sin(θ+φ₅))  # δ: ângulo de carga, radianos
	U₅=E₀*cos.(δ₃)-Zₛ.*I₃*cos(θ+φ₅)	 # cálculo da característica externa
end;

# ╔═╡ 1daacb53-b03f-476d-9ab0-c1dc59356147
begin
	plot(I₃, U₃, 
		title="U =f(I)", xlabel="I(A)", ylabel="U(V)", label="cosφ=0.9(i)",
		ylims=(0,2000), framestyle=:origin, minorticks=5, legend=:bottomleft)
	plot!(I₃, U₄, label="cosφ=1")
	plot!(I₃, U₅, label="cosφ=0.9(c)")
end

# ╔═╡ 889e92f2-9104-4206-8e2e-785fc750a2c2


# ╔═╡ 33bd0f07-6c4c-4e1b-bad1-719871b4e56e
md"""
### Caract. de regulação, $$I_{exc}=f(I)$$, para um dado $$\cos\varphi$$ 💻
"""

# ╔═╡ 1e30acf6-44bd-4caa-a461-ec358da607ea
md"""
A análise dos efeitos da corrente de carga e do factor de potência, quer no diagrama vectorial de tensões do alternador síncrono de pólos lisos, quer nas características externas para diferentes $$\cos\varphi$$, permite antever a necessidade de se regular a corrente de campo, $$I_{exc}$$, regulando o fluxo magnético, e por conseguinte, a fem, $$E_0$$, de modo a manter a tensão de saída do alternador síncrono, $$U$$, constante para qualquer carga.
"""

# ╔═╡ 1dc1c2e2-11e6-4d30-ac49-4797117a5dae
md"""
Tome-se, por exemplo, a corrente de campo em vazio de $$20$$A:
"""

# ╔═╡ 81223b60-4ca2-445e-9ce6-23261cd0e525
begin
	Iₑₓ₀=20
	U₀=E₀_i(Iₑₓ₀)		# interpolação da característica magnética
	Icc_iₑₓ₀=Icc_i(Iₑₓ₀) # interpolação da característica de curto-circuito
	Zₛ₀=U₀/(Icc_iₑₓ₀/√3) # cálculo de Zₛ em função da corrente de campo
	Xₛ₀=√(Zₛ₀^2-Rₛ^2)	  # cálculo de Xₛ em função da corrente de campo
	θ₀=atan(Xₛ₀/Rₛ)
	Iₑₓ₀, U₀, Icc_iₑₓ₀, Xₛ₀   
end

# ╔═╡ 8436976e-60cb-4904-aeb3-c9c65562a7a6
md"""
A resolução da equação vectorial de $$\overline{E}_0$$, dada por:

$$\overline{E}_0=\overline{U}+(R_s+jX_s)\overline{I}$$

permite determinar o valor da fem, $$E_0$$, e por consulta da característica magnética, obter a corrente de campo necessária para manter a tensão, $$U$$, constante em função da carga, $$I$$, e do factor de potência, $$\cos\varphi$$. 

Note-se, que o cálculo exacto desta equação vectorial apenas é possível recorrendo a métodos de cálculo númerico iterativos (método de Euler, Runge–Kutta, entre outros), pois a reactância síncrona, $$X_s$$, depende da solução final (corrente de campo).

Por simplificação na análise, admite-se que os efeitos da variação, quer da corrente de carga, quer do factor de potência, são mais significativos que a dependência $$X_s=f(I_{exc})$$, permitindo assim um cálculo aproximado, apresentado no gráfico de característica de regulação:
"""

# ╔═╡ 95aedd7b-68fd-49fc-aa2d-ef5852d20c72
H5=("φ -> cosφ", @bind phi₇ PlutoUI.Slider(-90:1:90, default=60, show_value=true))

# ╔═╡ c95b31b8-bfad-47d5-a5c8-bfb5340f76e3
begin
	φ₇=deg2rad(phi₇)
	I₃_=(I₃)∠(φ₇)
	#E₀₇_=(U₀)∠(0).+(Rₛ+(Xₛ₀)im).*I₃_        # opção 1: algo não está correcto...
	#E₀₇_=(U₀)∠(0).+((Zₛ₀)∠(θ₀)).*I₃_        # opção 2: pior ainda...
	#E₀₇=abs.(E₀₇_)                          # faz parte das opções 1 e2
	
	# opção 3: passando o cálculo vectorial para escalar, determinando 1º (tan δ) para depois determinar E₀:
	tanδ₇=(Zₛ₀.*I₃*sin(θ₀+φ₇))./(U₀.+Zₛ₀.*I₃*cos(θ₀+φ₇))  
	δ₇=atan.(tanδ₇)
	if δ₇==0
		E₀₇=(U₀+Zₛ₀.*I₃*cos(θ₀+φ₇))
		else
		E₀₇=Zₛ₀.*I₃*sin(θ₀+φ₇)./sin.(δ₇)
		end
	
	# interpolação da característica magnética para E₀:
	i_E₀=Spline1D(fem, Iₑₓ, k=1, bc="extrapolate")	
	iₑₓ_E₀=i_E₀(E₀₇)
	
	# traçado da caracterítica de regulação:
	plot(I₃, iₑₓ_E₀, 
		title="Iₑₓ =f(I)",
		xlabel = "I(A)", ylabel="Iₑₓ(A)", 
		ylims=(0,40), xlims=(0,110), 
		framestyle=:origin, minorticks=5, legend=:none)
end

# ╔═╡ c6f94497-b544-417f-a479-f6558be1edc7


# ╔═╡ 3f3ef7e6-095f-4b87-8dd4-cb98cce33f9a
md"""
### Efeitos de $$I_{exc}$$ e cosφ em $$U=f(I)$$ 💻
"""

# ╔═╡ 7ed35606-3e63-43a8-b946-5bd7679d534a
md"""
A corrente de campo, $$I_{exc}$$, afecta a fem e também o valor da reactância síncrona, em especial se a máquina estiver a funcionar na zona de saturação da característica magnética:
"""

# ╔═╡ 8f85182b-136d-42f2-b900-d234f2d52739
begin
	E₀_iₑₓ=E₀_i(Iexc) # interpolação da caract. magnética para Iexc
	Icc_iₑₓ=Icc_i(Iexc) # interpolação da caract. de c.c. para Iexc
	Zₛ_iₑₓ=E₀_iₑₓ/(Icc_iₑₓ/√3) # cálculo de Zₛ em função da corrente de campo
	Xₛ_iₑₓ=√(Zₛ_iₑₓ^2-Rₛ^2)	  # cálculo de Xₛ em função da corrente de campo
	Xₛ_iₑₓ=round(Xₛ_iₑₓ, digits=3)
	Iexc, E₀_iₑₓ, Icc_iₑₓ, Xₛ_iₑₓ
end

# ╔═╡ 42845857-b6d5-415f-abb8-072977e8c3db
begin
	H3=("Iₑₓ", @bind Iexc PlutoUI.Slider(11.5:0.5:33.5, default=33.5,show_value=true))
	H4=("φ -> cosφ", @bind phi₆ PlutoUI.Slider(-90:1:90, default=30, show_value=true))
	H3, H4
end

# ╔═╡ cb82f279-22e4-4c36-bf5a-32b10aea7606
begin
	φ₆=deg2rad(phi₆)
	θ₆=atan(Xₛ_iₑₓ/Rₛ)
	δ₆=asin.((Zₛ_iₑₓ/E₀_iₑₓ).*I₃*sin(θ₆+φ₆))
	U₆=E₀_iₑₓ*cos.(δ₆)-Zₛ_iₑₓ.*I₃*cos(θ₆+φ₆)
	plot(I₃, U₆, 
		title="U =f(I)", xlabel = "I(A)", ylabel="U(V)", 
		ylims=(0,3000), xlims=(0,160), 
		framestyle=:origin, minorticks=5, legend=:none)
end

# ╔═╡ 8a70bab4-014b-4f85-9ecb-821f9c4ed204
md"""
!!! nota
	O estudante deverá procurar perceber as implicações qualitativas das variações da corrente de campo, $$I_{exc}$$, e do factor de potência, $$\cos \varphi$$, na característica externa de um alternador síncrono.
"""

# ╔═╡ b7d03e6c-bb80-48ee-8df4-2cac6fc3e983


# ╔═╡ fae8d4d5-a0bd-4000-94d0-e030d9ee723e
md"""
## d) Cálulo da corrente de excitação para uma dada carga
**A corrente de excitação o alternador para alimentar um motor assíncrono trifásico a uma tensão de 1kV, sabendo que o motor desenvolve uma potência de 150kW com um factor de potência de 0.832 e um rendimento de 90%**

**Nota:** Admita que a impedância síncrona, $$Z_s$$, é igual à obtida da alínea anterior.
"""

# ╔═╡ 39b0c0d9-05e1-43eb-97e2-0ab169f9a2b0


# ╔═╡ cadba82d-785a-4306-9407-d65eca10c2b3
md"""
Considerando desprezáveis as perdas rotacionais no motor assíncrono, $$p_{rot}=0 \Rightarrow P_u=P_d$$, por conseguinte, a corrente na linha vem:

$$I_L=\frac{P_u}{η\sqrt{3} U_c \cos\varphi}$$
os vectores da corrente e da tensão por fase do alternador (estator em triângulo) vêm dados por:
$$\overline{I}=\frac{I_L}{\sqrt{3}}∠φ \quad$$ e $$\quad \overline{U}=U_c∠0°$$
"""

# ╔═╡ 94260acb-1a29-4de8-b46e-a1c440460847
md"""
Calculando a fem por resolução da equação vectorial de $$\overline{E}_0$$, obtém-se a corrente de campo, $$I_{exc}$$, consultando a característica magnética do alternador, obtendo-se, $$I_{exc}=$$ $iₑₓ_E₀ₘ A
"""

# ╔═╡ 1645c653-c4e6-45af-969c-440981b30bd0
begin
	(Pu, cosφₘ, η, Uₘ)=(150e3, 0.832, 0.9, 1e3)  #dados da alínea d)
	Iₗᵢₙₕₐ=Pu/(η*√3*Uₘ*cosφₘ)
	φₘ=-acos(cosφₘ)
	φₘ=rad2deg(φₘ)
	E₀ₘ_=(Uₘ)∠(0)+(Rₛ+Xₛ*im)*((Iₗᵢₙₕₐ/√3)∠(φₘ))
	E₀ₘ=abs(E₀ₘ_)								# módulo do vector da fem
	
	# interpolação da característica magnética para a fem calculada:
	iₑₓ_E₀ₘ=i_E₀(E₀ₘ)
	iₑₓ_E₀ₘ=round(iₑₓ_E₀ₘ, digits=1)
end;

# ╔═╡ db9572b9-50ea-438d-a82d-6befe3aa8d59


# ╔═╡ b870ec10-686b-4de1-99a7-abba19cd1fa4
md"""
# Setup
"""

# ╔═╡ 6a1038a4-81c8-450b-a91e-d0018570b760
md"""
## Números complexos em computação científica *Julia* 📌
"""

# ╔═╡ 7279e904-53dc-47dc-9cfd-05ca94824c31
md"""
### fasores (notação polar): $$∠$$
"""

# ╔═╡ 8dad7471-4cbb-4f36-a692-7dc05f7c4fcc
md"""
Em programação *Julia* os números complexos são apresentados na forma rectangular, como por exemplo: $$2+3im$$, sendo $$im$$ a representação da unidade imaginária, ou seja, $$im=\sqrt{-1}$$.  

Em engenharia electrotécnica é comum a utilização de fasores, ou seja, os números complexos serem representados na forma polar, utilizando o símbolo "$$∠$$" para a designação do ângulo do vector, algo que não é nativo na linguagem *Julia*.

No entanto, em *Julia* é possível atribuir a símbolos, valores ou funções. Assim, ao símbolo "$$∠$$" atribuí-se a forma polar de um número complexo na forma $$(módulo)∠(argumento)$$ com o $$argumento$$ em graus, utilizando a seguinte instrução:
"""

# ╔═╡ 2702f2c6-c0ab-4be9-a6ec-03b970994432
∠(x) = cis(deg2rad(x))

# ╔═╡ 2c052f02-7797-4b3e-ade2-1ffd38119bef
md"""
Assim torna-se possível a representação de fasores.
Exemplos:
"""

# ╔═╡ 6f871dfe-8c9e-48f4-88b1-2f581d997f95
begin
	I_=24∠(60)
	I_=round(I_, digits=1)
end

# ╔═╡ a4a8c395-ffde-46f1-997c-e92fd74e2e65
begin
	I3_=10∠(-45);
	I3=abs(I3_)
	ϕ₃=angle(I3_)
	ϕ₃=rad2deg(ϕ₃)
	I3_,I3, ϕ₃
end

# ╔═╡ a0f9fb43-765a-46c6-b1fc-dc0805d4ebc1
md"""
### Plano de Argand
"""

# ╔═╡ de1ba39b-e455-4639-b619-f6c628af8a3e
md"""
O *package* [`Plots`](http://docs.juliaplots.org/latest/), que tem sido utilizado nos diversos *notebooks* já apresentados para realização de gráficos, reconhece nativamente números complexos, representando-os num plano de Argand, também conhecido como plano complexo.

Assim, a utilização do plano de Argand para representação gráfica de grandezas vectoriais é realizado indicando cada vector por um segmento de recta na forma $$[origem, destino]$$, em que a $$origem$$ e $$destino$$ são números complexos (em qualquer das suas formas: rectangular, polar ou exponencial). A instrução `arrow` permite colocar o afixo do número complexo do lado desejado:
"""

# ╔═╡ 7544f034-d014-484d-90f5-9d6b4c842858
begin
	K3=1 # factor de escala para a corrente
	plot([0, K3*I3_], arrow=:closed, label="I3_")
	plot!([0, 40∠(0)], arrow=:closed, label="U∠0°", legend=:bottomright,
		 #size=(500,500), ylims=(-40,10), xlims=(0,50) # Correcção das dimensões
	)
end

# ╔═╡ 872c685b-fdbb-48d9-8e96-7982a7ca1faa
md"""
### função trigonométrica "arco cosseno"
"""

# ╔═╡ 865f7200-9032-49c2-a31c-b717c8d44607
md"""
Apenas para chamar a atenção que as funções trigonométricas em *Julia* são executadas considerando os ângulos na unidade de radiano:
"""

# ╔═╡ 553a05a9-904a-454b-b4be-0049dcd2d04d
cosϕ₁=0.8

# ╔═╡ 59117354-7977-4a2d-8869-a91f7f3ae102
ϕ₁=acos(cosϕ₁)*180/π

# ╔═╡ 390c6eb7-4013-413c-921a-bfec6b3d2728
md"""
ou alternativamente utilizando a instrução: `rad2deg`:
"""

# ╔═╡ 4f6d7663-987e-4a44-ab21-f772ae2add74
begin
	cosϕ₂=0.8 
	ϕ₂=acos(cosϕ₂)
	ϕ₂=rad2deg(ϕ₂)
end

# ╔═╡ 2c8d6083-a00e-4dba-8dfb-82d02ead0d44
md"""
O mesmo raciocínio aplica-se a outras funções trigonométricas: `sin`, `asin`, `tan`, `atan`, ...
"""

# ╔═╡ 249d4cdb-a1dd-4314-9799-63332d8b6da4


# ╔═╡ d81584a4-b770-4f9b-8905-c4b20265f970
md"""
## Índice
"""

# ╔═╡ 51b52082-bd67-4125-a247-a3f742eb8a95
TableOfContents(title="📚 Índice, Exercício 1")

# ╔═╡ 92c3607d-692f-437a-9a63-b4da1bf9e80c
md"""
!!! info
	No índice deste *notebook*, os tópicos assinalados com "💻" permitem interacção com o utilizador.  

	O tópico assinado com "📌" deve ser analisado previamente para melhor compreensão dos códigos em linguagem de programação científica *Julia* apresentados no *notebook*.
"""

# ╔═╡ 3aa40554-06a5-460a-a636-2dbed48e2e6b
md"""
## _Julia packages_
*Links to package help*: [Dierckx](https://github.com/kbarbary/Dierckx.jl), [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/)  
"""

# ╔═╡ 18c20096-84c1-4ec0-bb6d-185338676ced
begin
	using PlutoUI # user-interface do Pluto.jl
	using Plots   # Julia package para gráficos 
	using Dierckx # Julia package para interpolação/extrapolação de dados
end

# ╔═╡ 86e5d177-31e2-4247-a786-10e51450003f
md"""
!!! info
	## Programação _Julia_ e _notebooks Pluto_
	Saber mais sobre: [_Julia_/_Pluto_](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/README.md)
"""

# ╔═╡ 40543484-b56b-4708-b4c3-97ac50de8c41
md"""
## _Notebook_

*Notebook* realizado em linguagem de programação *Julia* versão $(version) para a unidade curricular de Máquinas Elétricas 2 (ISEL\LEE).   

Tempo de cálculo do *notebook* (1ª execução): até cerca de 5 min.  

**Ricardo Luís** (Professor Adjunto, ISEL\DEEEA\GDME) \
ISEL, 20/Nov/2021
"""

# ╔═╡ a3c5053d-d05d-4f8c-a04f-3ea44e7fc2ec
version=VERSION;

# ╔═╡ 8d5d1d2f-464f-4c4d-815e-0d84f564dece
md"""
Este conteúdo possui licença [![](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-sa/4.0/).
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Dierckx = "~0.5.1"
Plots = "~1.23.6"
PlutoUI = "~0.7.19"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0bc60e3006ad95b4bb7497698dd7c6d649b9bc06"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.1"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f885e7e7c124f8c92650d61b9477b9ac2ee607dd"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.1"

[[ChangesOfVariables]]
deps = ["LinearAlgebra", "Test"]
git-tree-sha1 = "9a1d594397670492219635b35a3d830b04730d62"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.1"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "a851fec56cb73cfdf43762999ec72eff5b86882a"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.15.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "dce3e3fea680869eaa0b774b2e8343e9ff442313"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.40.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Dierckx]]
deps = ["Dierckx_jll"]
git-tree-sha1 = "5fefbe52e9a6e55b8f87cb89352d469bd3a3a090"
uuid = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
version = "0.5.1"

[[Dierckx_jll]]
deps = ["CompilerSupportLibraries_jll", "Libdl", "Pkg"]
git-tree-sha1 = "a580560f526f6fc6973e8bad2b036514a4e3b013"
uuid = "cd4c43a9-7502-52ba-aa6d-59fb2a88580b"
version = "0.0.1+0"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "30f2b340c2fff8410d89bfcdc9c0a6dd661ac5f7"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.62.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fd75fa3a2080109a2c0ec9864a6e14c60cca3866"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.62.0+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a8f4f279b6fa3c3c4f1adadd78a621b13a506bce"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.9"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "c9551dd26e31ab17b86cbd00c2ede019c08758eb"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+1"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "be9eef9f9d78cecb6f262f3c10da151a6c5ab827"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "b084324b4af5a438cd63619fd006614b3b20b87b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.15"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun"]
git-tree-sha1 = "0d185e8c33401084cab546a756b387b15f76720c"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.23.6"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "e071adf21e165ea0d904b595544a8e514c8bb42c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.19"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "c6c0f690d0cc7caddb74cef7aa847b824a16b256"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+1"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3c76dde64d03699e074ac02eb2e8ba8254d428da"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.13"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "2bb0cb32026a66037360606510fca5984ccc6b75"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.13"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "fed34d0e71b91734bf0a7e10eb1bb05296ddbcd0"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─f5450eab-0f9f-4b7f-9b80-992d3c553ba9
# ╟─1f39885e-3df2-4d9b-98ee-534bd66f3ad7
# ╟─aa7b7835-802d-46c7-8245-6bf29d799026
# ╟─df765cd9-5fd1-490a-a4f5-c05edb26ef1b
# ╟─520962f0-6513-4615-ba08-a973b851ec8f
# ╠═99485bd5-46b8-425b-8974-6056c903b062
# ╟─82ddc4f5-e411-48da-abab-cc2029ee02f0
# ╠═8da1cb6d-5f5a-49b1-9ab8-9a00d229b519
# ╟─0a44521c-58b4-47d3-968c-d345799e42bb
# ╟─b90f442f-41aa-485b-b0f0-170e282c028c
# ╠═46318b60-7480-44f8-94bc-10f69a425d54
# ╟─90712d40-b1a5-445e-a1da-af62ecab7e59
# ╠═638d41c0-4a34-4a30-9928-ba88507334af
# ╟─b9f959bf-abc2-4cc8-9f1d-584bb4728e89
# ╟─59f534f3-da67-406c-ae7f-9f3ddf13d1fe
# ╠═3570ce87-a57d-4abb-8477-f33957697952
# ╟─94c43668-0ddd-4550-9bca-5b05a1ede581
# ╟─5e679cb2-dd7f-4cf5-8035-54ae205eba1e
# ╠═5d555c37-3ea9-4315-b31f-c5ce86896160
# ╟─69998624-54dc-49a6-9053-0322c72982ea
# ╠═67329e1c-c84a-4a64-abdf-d086b59cee6d
# ╟─a2c4ba4e-56fa-4aaa-ba4a-5b5acb3cb2d8
# ╠═ccec9d74-f4aa-4254-89a1-f99e2e1cf653
# ╟─7df06422-db2c-4494-97c1-6ed2a1bc77eb
# ╟─87bf1d67-5f81-496e-a6ee-821b3f3eb1b0
# ╟─ce99f675-29ac-4413-94a9-febe1243e79d
# ╠═2385f6d9-1770-4fee-a7ab-3322f2d6e9ed
# ╟─e3a3c2f7-43f5-40ab-8693-9affc1130373
# ╟─ff08e1d0-6acd-4b46-ab75-51329cb00c22
# ╟─57790c82-9d40-4244-8b5d-3fcf98ce12e7
# ╠═ae01b249-cb76-43ae-9938-f489b93cc0ea
# ╟─6d73fbfe-0cf7-4925-a814-c42438e75fe0
# ╟─96d3e48e-60bc-4c97-aac4-6517502fa936
# ╟─f68a29b1-64c3-466b-987b-0c66b8385af3
# ╟─4287947f-5fcc-4400-b4ea-7ddb29d259cf
# ╟─e934fad8-c4fe-4e7f-bc64-e1c3f3e52460
# ╟─d3581eff-e1c7-4e01-b722-3d94ff428746
# ╟─14df28f1-6cb0-4e18-b5f0-4c8f94d02a56
# ╟─76b147a2-d33f-49ef-8236-444818042a12
# ╠═f50dc850-e32d-4fb3-afd2-0217cf8df1fc
# ╠═2dd82e2e-675f-40dd-882f-fe90db117589
# ╠═b350ee3d-7705-4712-a9bd-d16d4a83f89b
# ╟─cd338db8-8a5b-4ebf-a93d-95b1a7433de7
# ╟─ba2a8447-a8a0-4ce8-9d53-03a0369703c6
# ╟─8a1756c9-6d37-4541-ba8d-586e95b4feda
# ╟─9238a818-157c-4523-b6b2-139faf8ebe44
# ╟─c53c93f9-1960-4999-a3d8-ec0c654f4275
# ╟─58011f3c-364f-42b7-a9de-17fe736f80d1
# ╠═894c1642-9272-4624-b7a3-c8a882fbc337
# ╟─079234a4-3aa6-4932-8a25-2a8c8f290368
# ╠═373a9233-e5d1-4c18-a1aa-162f3a1a00be
# ╟─b2a13c34-84be-4c7d-bcd8-9186a4975559
# ╠═fee556d9-aa55-4187-b83c-afa2173e2adb
# ╠═1daacb53-b03f-476d-9ab0-c1dc59356147
# ╟─889e92f2-9104-4206-8e2e-785fc750a2c2
# ╟─33bd0f07-6c4c-4e1b-bad1-719871b4e56e
# ╟─1e30acf6-44bd-4caa-a461-ec358da607ea
# ╟─1dc1c2e2-11e6-4d30-ac49-4797117a5dae
# ╠═81223b60-4ca2-445e-9ce6-23261cd0e525
# ╟─8436976e-60cb-4904-aeb3-c9c65562a7a6
# ╟─95aedd7b-68fd-49fc-aa2d-ef5852d20c72
# ╟─c95b31b8-bfad-47d5-a5c8-bfb5340f76e3
# ╟─c6f94497-b544-417f-a479-f6558be1edc7
# ╟─3f3ef7e6-095f-4b87-8dd4-cb98cce33f9a
# ╟─7ed35606-3e63-43a8-b946-5bd7679d534a
# ╠═8f85182b-136d-42f2-b900-d234f2d52739
# ╟─42845857-b6d5-415f-abb8-072977e8c3db
# ╠═cb82f279-22e4-4c36-bf5a-32b10aea7606
# ╟─8a70bab4-014b-4f85-9ecb-821f9c4ed204
# ╟─b7d03e6c-bb80-48ee-8df4-2cac6fc3e983
# ╟─fae8d4d5-a0bd-4000-94d0-e030d9ee723e
# ╟─39b0c0d9-05e1-43eb-97e2-0ab169f9a2b0
# ╟─cadba82d-785a-4306-9407-d65eca10c2b3
# ╟─94260acb-1a29-4de8-b46e-a1c440460847
# ╠═1645c653-c4e6-45af-969c-440981b30bd0
# ╟─db9572b9-50ea-438d-a82d-6befe3aa8d59
# ╟─b870ec10-686b-4de1-99a7-abba19cd1fa4
# ╟─6a1038a4-81c8-450b-a91e-d0018570b760
# ╟─7279e904-53dc-47dc-9cfd-05ca94824c31
# ╟─8dad7471-4cbb-4f36-a692-7dc05f7c4fcc
# ╠═2702f2c6-c0ab-4be9-a6ec-03b970994432
# ╟─2c052f02-7797-4b3e-ade2-1ffd38119bef
# ╠═6f871dfe-8c9e-48f4-88b1-2f581d997f95
# ╠═a4a8c395-ffde-46f1-997c-e92fd74e2e65
# ╟─a0f9fb43-765a-46c6-b1fc-dc0805d4ebc1
# ╟─de1ba39b-e455-4639-b619-f6c628af8a3e
# ╠═7544f034-d014-484d-90f5-9d6b4c842858
# ╟─872c685b-fdbb-48d9-8e96-7982a7ca1faa
# ╟─865f7200-9032-49c2-a31c-b717c8d44607
# ╠═553a05a9-904a-454b-b4be-0049dcd2d04d
# ╠═59117354-7977-4a2d-8869-a91f7f3ae102
# ╟─390c6eb7-4013-413c-921a-bfec6b3d2728
# ╠═4f6d7663-987e-4a44-ab21-f772ae2add74
# ╟─2c8d6083-a00e-4dba-8dfb-82d02ead0d44
# ╟─249d4cdb-a1dd-4314-9799-63332d8b6da4
# ╟─d81584a4-b770-4f9b-8905-c4b20265f970
# ╠═51b52082-bd67-4125-a247-a3f742eb8a95
# ╟─92c3607d-692f-437a-9a63-b4da1bf9e80c
# ╟─3aa40554-06a5-460a-a636-2dbed48e2e6b
# ╠═18c20096-84c1-4ec0-bb6d-185338676ced
# ╟─86e5d177-31e2-4247-a786-10e51450003f
# ╟─40543484-b56b-4708-b4c3-97ac50de8c41
# ╟─a3c5053d-d05d-4f8c-a04f-3ea44e7fc2ec
# ╟─8d5d1d2f-464f-4c4d-815e-0d84f564dece
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
