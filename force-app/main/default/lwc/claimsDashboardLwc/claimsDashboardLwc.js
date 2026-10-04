import { LightningElement, wire } from 'lwc';
import getClaimsDashboard from '@salesforce/apex/ClaimsAdjusterController.getClaimsDashboard';

export default class ClaimsDashboardLwc extends LightningElement {
    dashboardData;
    claims = [];
    filteredClaims = [];
    error;
    searchText = '';
    selectedStatus = 'All';

    @wire(getClaimsDashboard)
    wiredDashboard({ data, error }) {
        if (data) {
            this.dashboardData = data;
            this.claims = data.claims;
            this.filteredClaims = data.claims;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.dashboardData = undefined;
        }
    }

    get totalClaims() {
        return this.dashboardData ? this.dashboardData.totalClaims : 0;
    }

    get pendingClaims() {
        return this.dashboardData ? this.dashboardData.pendingClaims : 0;
    }

    get highPriorityClaims() {
        return this.dashboardData ? this.dashboardData.highPriorityClaims : 0;
    }

    get totalClaimAmount() {
        return this.dashboardData ? this.dashboardData.totalClaimAmount : 0;
    }

    get statusOptions() {
        return [
            { label: 'All', value: 'All' },
            { label: 'New', value: 'New' },
            { label: 'Under Review', value: 'Under Review' },
            { label: 'Approved', value: 'Approved' },
            { label: 'Rejected', value: 'Rejected' },
            { label: 'Settled', value: 'Settled' }
        ];
    }

    handleSearch(event) {
        this.searchText = event.target.value.toLowerCase();
        this.applyFilters();
    }

    handleStatusChange(event) {
        this.selectedStatus = event.detail.value;
        this.applyFilters();
    }

    applyFilters() {
        this.filteredClaims = this.claims.filter(claim => {
            const matchesSearch =
                !this.searchText ||
                claim.claimNumber?.toLowerCase().includes(this.searchText) ||
                claim.customerName?.toLowerCase().includes(this.searchText);

            const matchesStatus =
                this.selectedStatus === 'All' ||
                claim.status === this.selectedStatus;

            return matchesSearch && matchesStatus;
        });
    }
}
