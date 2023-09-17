# "lpSolveAPI" paketini yükleme
Install.packages("lpSolveAPI")
library(lpSolveAPI)

# Boş bir model oluştur
model <- make.lp(0, 4)

# Modeli maksimize etme (sense="maximize")
lp.control(model, sense="maximize")

# Obje fonksiyonunu tanımla
set.objfn(model, c(207.25, 97.75, 128.75, 153.5))

# Kısıtları ekle
add.constraint(model, c(13.5, 11.2, 15, 13), "<=", 11.700)
add.constraint(model, c(6, 4.5, 6.5, 6), "<=", 2.600)
add.constraint(model, c(2, 1, 0.75, 2), "<=", 1.820)
add.constraint(model, c(0.65, 1, 0.5, 0.65), "<=", 1.820)
add.constraint(model, c(2.75, 4.5 , 2, 2.5), "<=", 7.800)
add.constraint(model, c(0, 0 , 0.5, 0.1), "<=", 50)
add.constraint(model, c(0.025, 0 , 0.025, 0.025), "<=", 25)
add.constraint(model, c(0.025, 0 , 0.025, 0.025), "<=", 25)
add.constraint(model, c(0.1, 0.05 , 0.075, 0.1), "<=", 100)
add.constraint(model, c(0.075, 0 , 0, 0), "<=", 39)
add.constraint(model, c(0, 0 , 0.1, 0.075), "<=", 26)
add.constraint(model, c(0, 0.063 , 0, 0), "<=", 26)
add.constraint(model, c(0, 3 , 0, 1), "<=", 3.900)

# Satır ve sütun isimlerini tanımla
RowNames <- c("Maize","Soya Beans", "Lime Stone","Bone","Wheat Offal",
              "Fish Offal", "Lysine", "Methionine","Salt","Layer Premix",
              "Broiler Premix", "Grower Premix", "P.K.C")
ColNames <- c("Layer Mash","Grower Mash","Broiler Starter Mash",
              "Broiler Finisher Mash")

# Modelin boyutlarını tanımla
dimnames(model) <- list(RowNames, ColNames)

model # or equivalently print(model)

# Modeli çöz
solve(model)

# Obje fonksiyonunun değerini al
get.objective(model)

# Değişkenlerin değerlerini al
get.variables(model)

# Kısıtları al
get.constraints(model)

# Değişken sınırlarını al
get.bounds(model)

# Temel değişkenleri al (nonbasic = FALSE)
get.basis(model, nonbasic = FALSE)
