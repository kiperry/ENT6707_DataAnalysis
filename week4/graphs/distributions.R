library(ggplot2)
library(RColorBrewer)
cols <- c(rgb(128, 26, 79, maxColorValue = 255),
          rgb(26, 128, 75, maxColorValue = 255),
          rgb(26, 79, 128, maxColorValue = 255),
          rgb(128, 75, 26, maxColorValue = 255))
          


####################################################################
#
#          Normal distribution
#
####################################################################
x <- seq(-5,5,0.01)

# Normal distribution 1
sigma_1 <- 1
mu_1 <- 0
fx_1 <- (1/(sqrt(sigma_1)*(sqrt(2*pi)))) * exp( (-1/2) * ((x-mu_1)/sqrt(sigma_1))^2)
my_norm_1 <- cbind.data.frame(fx_1=fx_1, x=x)
label1 <- "italic(X) %~% italic(N)(mu == 0, sigma^2 == 1.0)"
# Normal distribution 2
sigma_2 <- 4
mu_2 <- 0
fx_2 <- (1/(sqrt(sigma_2)*(sqrt(2*pi)))) * exp( (-1/2) * ((x-mu_2)/sqrt(sigma_2))^2)
my_norm_2 <- cbind.data.frame(fx_2=fx_2, x=x)
label2 <- "italic(X) %~% italic(N)(mu == 0, sigma^2 == 4.0)"
# Normal distribution 3
sigma_3 <- 0.2
mu_3 <- 0
fx_3 <- (1/(sqrt(sigma_3)*(sqrt(2*pi)))) * exp( (-1/2) * ((x-mu_3)/sqrt(sigma_3))^2)
my_norm_3 <- cbind.data.frame(fx_3=fx_3, x=x)
label3 <- "italic(X) %~% italic(N)(mu == 0, sigma^2 == 0.2)"
# Normal distribution 4
sigma_4 <- 0.5
mu_4 <- 2
fx_4 <- (1/(sqrt(sigma_4)*(sqrt(2*pi)))) * exp( (-1/2) * ((x-mu_4)/sqrt(sigma_4))^2)
my_norm_4 <- cbind.data.frame(fx_4=fx_4, x=x)
label4 <- "italic(X) %~% italic(N)(mu == 2, sigma^2 == 0.5)"

ggplot()+
   geom_line(data=my_norm_1, aes(x=x, y=fx_1), color=cols[1], size=1.5)+
   annotate(geom="text", x=-2.5, y=0.25, label=label1, parse=T, color=cols[1])+
   #
   geom_line(data=my_norm_2, aes(x=x, y=fx_2), color=cols[2], size=1.5)+
   annotate(geom="text", x=-3.5, y=0.15, label=label2, parse=T, color=cols[2])+
   #
   geom_line(data=my_norm_3, aes(x=x, y=fx_3), color=cols[3], size=1.5)+
   annotate(geom="text", x=2, y=0.75, label=label3, parse=T, color=cols[3])+
   #
   geom_line(data=my_norm_4, aes(x=x, y=fx_4), color=cols[4], size=1.5)+
   annotate(geom="text", x=3.5, y=0.60, label=label4, parse=T, color=cols[4])+
   #
   theme_classic()+
   xlab("x")+
   ylab("P")
 


# sample from normal
set.seed(1)
x_norm <- data.frame(rando_norm=rnorm(100,mu_4,sigma_4))
breaks_norm <- pretty(range(x_norm$rando_norm), n = nclass.FD(x_norm$rando_norm), min.n = 1)
bwidth_norm <- breaks_norm[2]-breaks_norm[1]


ggplot(x_norm, aes(x=rando_norm, fill="#E69F00", color="#E69F00")) +
  geom_histogram(binwidth=bwidth_norm,position="identity", alpha=0.5)+
  scale_color_manual(values=c("#E69F00"))+
  scale_fill_manual(values=c( "#E69F00"))+
  labs(x="x", y = "Count")+
  theme_classic()+
  theme(legend.position = "none")+
  annotate(geom="text", x=1.3, y=15, label=label4, parse=T)
  






####################################################################
#
#         Binomial distribution
#
####################################################################
# Binomial distribution 1
n_1 <- 20 # number of trials
p_1 <- 0.5 # probability of success
x_1 <- 1:n_1 # possibe successes
bin_cof_1 <- factorial(n_1) / (factorial(x_1) * factorial(n_1-x_1))
Px_1 <- bin_cof_1 * (p_1^x_1) * ((1-p_1)^(n_1-x_1))
my_bin_1 <- cbind.data.frame(Px_1=Px_1, x=x_1)
label_bin_1 <- "italic(X) %~% italic(B)(italic(n) == 20, italic(p) == 0.5)"

# Binomial distribution 2
n_2 <- 20 # number of trials
p_2 <- 0.8 # probability of success
x_2 <- 1:n_2 # possibe successes
bin_cof_2 <- factorial(n_2) / (factorial(x_2) * factorial(n_2-x_2))
Px_2 <- bin_cof_2 * (p_2^x_2) * ((1-p_2)^(n_2-x_2))
my_bin_2 <- cbind.data.frame(Px_2=Px_2, x=x_2)
label_bin_2 <- "italic(X) %~% italic(B)(italic(n) == 20, italic(p) == 0.8)"

# Binomial distribution 3
n_3 <- 40 # number of trials
p_3 <- 0.5 # probability of success
x_3 <- 1:n_3 # possibe successes
bin_cof_3 <- factorial(n_3) / (factorial(x_3) * factorial(n_3-x_3))
Px_3 <- bin_cof_3 * (p_3^x_3) * ((1-p_3)^(n_3-x_3))
my_bin_3 <- cbind.data.frame(Px_3=Px_3, x=x_3)
label_bin_3 <- "italic(X) %~% italic(B)(italic(n) == 40, italic(p) == 0.5)"

ggplot()+
  geom_point(data=my_bin_1, aes(x=x, y=Px_1), color=cols[1], size=2) +
  geom_line(data=my_bin_1, aes(x=x, y=Px_1), color=cols[1], size=0.5) +
  annotate(geom="text", x=6, y=0.19, label=label_bin_1, parse=T, color=cols[1])+
  #
  geom_point(data=my_bin_2, aes(x=x, y=Px_2), color=cols[2], size=2) +
  geom_line(data=my_bin_2, aes(x=x, y=Px_2), color=cols[2], size=0.5) +
    annotate(geom="text", x=23.5, y=0.21, label=label_bin_2, parse=T, color=cols[2])+
  #
  geom_point(data=my_bin_3, aes(x=x, y=Px_3), color=cols[3], size=2) +
  geom_line(data=my_bin_3, aes(x=x, y=Px_3), color=cols[3], size=0.5) +
  annotate(geom="text", x=28, y=0.12, label=label_bin_3, parse=T, color=cols[3])+
  theme_classic()+
  xlab("x")+
  ylab("P")


# sample from binomial

# random sample from binomial
set.seed(1)
x_bin <- data.frame(rando_binom=rbinom(100,n_1,p_1))
breaks_bin <- pretty(range(x_bin$rando_binom), n = nclass.FD(x_bin$rando_binom), min.n = 1)
bwidth_bin <- breaks_bin[2]-breaks_bin[1]

ggplot(x_bin, aes(x=rando_binom, fill="#E69F00", color="#E69F00")) +
  geom_histogram(binwidth=bwidth_bin, position="identity", alpha=0.5)+
  scale_color_manual(values=c("#E69F00"))+
  scale_fill_manual(values=c( "#E69F00"))+
  labs(x="x", y = "Count")+
  theme_classic()+
  theme(legend.position = "none")+
  annotate(geom="text", x=6, y=18, label=label_bin_1, parse=T)






####################################################################
#
#         Poisson distribution
#
####################################################################
x <- seq(1,40,1)

# Poisson distribution 1
lambda_1 <- 2 #
fx_1 <- lambda_1^x * exp(-lambda_1) / factorial(x)
my_pois_1 <- cbind.data.frame(fx_1=fx_1, x=x)
label_pois_1 <- "italic(X) %~% Pois(lambda == 2)"
# Poisson distribution 2
lambda_2 <- 5 #
fx_2 <- lambda_2^x * exp(-lambda_2) / factorial(x)
my_pois_2 <- cbind.data.frame(fx_2=fx_2, x=x)
label_pois_2 <- "italic(X) %~% Pois(lambda == 5)"
# Poisson distribution 3
lambda_3 <- 20 #
fx_3 <- lambda_3^x * exp(-lambda_3) / factorial(x)
my_pois_3 <- cbind.data.frame(fx_3=fx_3, x=x)
label_pois_3 <- "italic(X) %~% Pois(italic(lambda) == 20)"


ggplot()+
  geom_point(data=my_pois_1, aes(x=x, y=fx_1), color=cols[1], size=2) +
  geom_line(data=my_pois_1, aes(x=x, y=fx_1), color=cols[1], size=0.5) +
  annotate(geom="text", x=7, y=0.25, label=label_pois_1, parse=T, color=cols[1])+
  #
  geom_point(data=my_pois_2, aes(x=x, y=fx_2), color=cols[2], size=2) +
  geom_line(data=my_pois_2, aes(x=x, y=fx_2), color=cols[2], size=0.5) +
  annotate(geom="text", x=11, y=0.15, label=label_pois_2, parse=T, color=cols[2])+
  #
  geom_point(data=my_pois_3, aes(x=x, y=fx_3), color=cols[3], size=2) +
  geom_line(data=my_pois_3, aes(x=x, y=fx_3), color=cols[3], size=0.5) +
  annotate(geom="text", x=26, y=0.10, label=label_pois_3, parse=T, color=cols[3])+
  #
  theme_classic()+
  xlab("x")+
  ylab("P")

# random sample from poisson
set.seed(1)
x_pois <- data.frame(rando_pois=rpois(100,lambda_2))
breaks_pois <- pretty(range(x_pois$rando_pois), n = nclass.FD(x_pois$rando_pois), min.n = 1)
bwidth_pois <- breaks_pois[2]-breaks_pois[1]

ggplot(x_pois, aes(x=rando_pois, fill="#E69F00", color="#E69F00")) +
  geom_histogram(binwidth=bwidth_pois,position="identity", alpha=0.5)+
  scale_color_manual(values=c("#E69F00"))+
  scale_fill_manual(values=c( "#E69F00"))+
  labs(x="x", y = "Count")+
  theme_classic()+
  theme(legend.position = "none")+
  annotate(geom="text", x=9, y=18, label=label_pois_2, parse=T)

