%% CPTP projection subroutine from 10.1103/PhysRevA.98.062336
function Cperp = CPTP(C)
k = 1;
p(:,k) = zeros([8^2,1]);
q(:,k) = zeros([8^2,1]);
y(:,k) = zeros([8^2,1]);
x(:,k) = vec(C);


y(:,k+1) = vec(TP(invec(x(:,k)+p(:,k))));
p(:,k+1) = x(:,k)+p(:,k)-y(:,k);
x(:,k+1) = vec(CP(invec(y(:,k)+q(:,k))));
q(:,k+1) = y(:,k)+q(:,k)-x(:,k+1);
k = k+1;

prec = 1e-4;
iter = 0;
while  (((norm((p(:,k-1)-p(:,k))))^2 + (norm((q(:,k-1)-q(:,k))))^2 + abs(2*(p(:,k-1)'*(x(:,k)-x(:,k-1))))+ abs(2*(q(:,k-1)'*(y(:,k)-y(:,k-1)))))> prec)
iter = iter +1;
y(:,k+1) = vec(TP(invec(x(:,k)+p(:,k))));
p(:,k+1) = x(:,k)+p(:,k)-y(:,k);
x(:,k+1) = vec(CP(invec(y(:,k)+q(:,k))));
q(:,k+1) = y(:,k)+q(:,k)-x(:,k+1);
k = k+1;
end
Cperp = invec(x(:,k));
end